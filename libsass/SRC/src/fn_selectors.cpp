#include "parser.hpp"
#include "extend.hpp"
#include "fn_utils.hpp"
#include "fn_selectors.hpp"

namespace Sass {

  namespace Functions {

    Signature selector_nest_sig = "selector-nest($selectors...)";
    BUILT_IN(selector_nest)
    {
      List_Ptr arglist = ARG("$selectors", List);

      // Not enough parameters
      if( arglist->length() == 0 )
        error("$selectors: At least one selector must be passed for `selector-nest'", pstate, traces);

      // Parse args into vector of selectors
      SelectorStack parsedSelectors;
      for (size_t i = 0, L = arglist->length(); i < L; ++i) {
        Expression_Obj exp = Cast<Expression>(arglist->value_at_index(i));
        if (exp->concrete_type() == Expression::NULL_VAL) {
          std::stringstream msg;
          msg << "$selectors: null is not a valid selector: it must be a string,\n";
          msg << "a list of strings, or a list of lists of strings for 'selector-nest'";
          error(msg.str(), pstate, traces);
        }
        if (String_Constant_Obj str = Cast<String_Constant>(exp)) {
          str->quote_mark(0);
        }
        std::string exp_src = exp->to_string(ctx.c_options);
        Selector_List_Obj sel = Parser::parse_selector(exp_src.c_str(), ctx, traces);
        parsedSelectors.push_back(sel);
      }

      // Nothing to do
      if( parsedSelectors.empty() ) {
        return SASS_MEMORY_NEW(Null, pstate);
      }

      // Set the first element as the `result`, keep appending to as we go down the parsedSelector vector.
      SelectorStack::iterator itr = parsedSelectors.begin();
      Selector_List_Obj result = *itr;
      ++itr;

      for(;itr != parsedSelectors.end(); ++itr) {
        Selector_List_Obj child = *itr;
        std::vector<Complex_Selector_Obj> exploded;
        selector_stack.push_back(result);
        Selector_List_Obj rv = child->resolve_parent_refs(selector_stack, traces);
        selector_stack.pop_back();
        for (size_t m = 0, mLen = rv->length(); m < mLen; ++m) {
          exploded.push_back((*rv)[m]);
        }
        result->elements(exploded);
      }

      Listize listize;
      return Cast<Value>(result->perform(&listize));
    }

    Signature selector_append_sig = "selector-append($selectors...)";
    BUILT_IN(selector_append)
    {
      List_Ptr arglist = ARG("$selectors", List);

      // Not enough parameters
      if( arglist->length() == 0 )
        error("$selectors: At least one selector must be passed for `selector-append'", pstate, traces);

      // Parse args into vector of selectors
      SelectorStack parsedSelectors;
      for (size_t i = 0, L = arglist->length(); i < L; ++i) {
        Expression_Obj exp = Cast<Expression>(arglist->value_at_index(i));
        if (exp->concrete_type() == Expression::NULL_VAL) {
          std::stringstream msg;
          msg << "$selectors: null is not a valid selector: it must be a string,\n";
          msg << "a list of strings, or a list of lists of strings for 'selector-append'";
          error(msg.str(), pstate, traces);
        }
        if (String_Constant_Ptr str = Cast<String_Constant>(exp)) {
          str->quote_mark(0);
        }
        std::string exp_src = exp->to_string();
        Selector_List_Obj sel = Parser::parse_selector(exp_src.c_str(), ctx, traces);
        parsedSelectors.push_back(sel);
      }

      // Nothing to do
      if( parsedSelectors.empty() ) {
        return SASS_MEMORY_NEW(Null, pstate);
      }

      // Set the first element as the `result`, keep appending to as we go down the parsedSelector vector.
      SelectorStack::iterator itr = parsedSelectors.begin();
      Selector_List_Obj result = *itr;
      ++itr;

      for(;itr != parsedSelectors.end(); ++itr) {
        Selector_List_Obj child = *itr;
        std::vector<Complex_Selector_Obj> newElements;

        // For every COMPLEX_SELECTOR in `result`
        // For every COMPLEX_SELECTOR in `child`
          // let parentSeqClone equal a copy of result->elements[i]
          // let childSeq equal child->elements[j]
          // Append all of childSeq head elements into parentSeqClone
          // Set the innermost tail of parentSeqClone, to childSeq's tail
        // Replace result->elements with newElements
        for (size_t i = 0, resultLen = result->length(); i < resultLen; ++i) {
          for (size_t j = 0, childLen = child->length(); j < childLen; ++j) {
            Complex_Selector_Obj parentSeqClone = SASS_MEMORY_CLONE((*result)[i]);
            Complex_Selector_Obj childSeq = (*child)[j];
            Complex_Selector_Obj base = childSeq->tail();

            // Must be a simple sequence
            if( childSeq->combinator() != Complex_Selector::Combinator::ANCESTOR_OF ) {
              std::string msg("Can't append \"");
              msg += childSeq->to_string();
              msg += "\" to \"";
              msg += parentSeqClone->to_string();
              msg += "\" for `selector-append'";
              error(msg, pstate, traces);
            }

            // Cannot be a Universal selector
            Element_Selector_Obj pType = Cast<Element_Selector>(childSeq->head()->first());
            if(pType && pType->name() == "*") {
              std::string msg("Can't append \"");
              msg += childSeq->to_string();
              msg += "\" to \"";
              msg += parentSeqClone->to_string();
              msg += "\" for `selector-append'";
              error(msg, pstate, traces);
            }

            // TODO: Add check for namespace stuff

            // append any selectors in childSeq's head
            parentSeqClone->innermost()->head()->concat(base->head());

            // Set parentSeqClone new tail
            parentSeqClone->innermost()->tail( base->tail() );

            newElements.push_back(parentSeqClone);
          }
        }

        result->elements(newElements);
      }

      Listize listize;
      return Cast<Value>(result->perform(&listize));
    }

    Signature selector_unify_sig = "selector-unify($selector1, $selector2)";
    BUILT_IN(selector_unify)
    {
      Selector_List_Obj selector1 = ARGSELS("$selector1");
      Selector_List_Obj selector2 = ARGSELS("$selector2");

      Selector_List_Obj result = selector1->unify_with(selector2);
      Listize listize;
      return Cast<Value>(result->perform(&listize));
    }

    Signature simple_selectors_sig = "simple-selectors($selector)";
    BUILT_IN(simple_selectors)
    {
      Compound_Selector_Obj sel = ARGSEL("$selector");

      List_Ptr l = SASS_MEMORY_NEW(List, sel->pstate(), sel->length(), SASS_COMMA);

      for (size_t i = 0, L = sel->length(); i < L; ++i) {
        Simple_Selector_Obj ss = (*sel)[i];
        std::string ss_string = ss->to_string() ;

        l->append(SASS_MEMORY_NEW(String_Quoted, ss->pstate(), ss_string));
      }

      return l;
    }

    Signature selector_extend_sig = "selector-extend($selector, $extendee, $extender)";
    BUILT_IN(selector_extend)
    {
      Selector_List_Obj  selector = ARGSELS("$selector");
      Selector_List_Obj  extendee = ARGSELS("$extendee");
      Selector_List_Obj  extender = ARGSELS("$extender");

      Subset_Map subset_map;
      extender->populate_extends(extendee, subset_map);
      Extend extend(subset_map);

      Selector_List_Obj result = extend.extendSelectorList(selector, false);

      Listize listize;
      return Cast<Value>(result->perform(&listize));
    }

    Signature selector_replace_sig = "selector-replace($selector, $original, $replacement)";
    BUILT_IN(selector_replace)
    {
      Selector_List_Obj selector = ARGSELS("$selector");
      Selector_List_Obj original = ARGSELS("$original");
      Selector_List_Obj replacement = ARGSELS("$replacement");
      Subset_Map subset_map;
      replacement->populate_extends(original, subset_map);
      Extend extend(subset_map);

      Selector_List_Obj result = extend.extendSelectorList(selector, true);

      Listize listize;
      return Cast<Value>(result->perform(&listize));
    }

    Signature selector_parse_sig = "selector-parse($selector)";
    BUILT_IN(selector_parse)
    {
      Selector_List_Obj sel = ARGSELS("$selector");

      Listize listize;
      return Cast<Value>(sel->perform(&listize));
    }

    Signature is_superselector_sig = "is-superselector($super, $sub)";
    BUILT_IN(is_superselector)
    {
      Selector_List_Obj  sel_sup = ARGSELS("$super");
      Selector_List_Obj  sel_sub = ARGSELS("$sub");
      bool result = sel_sup->is_superselector_of(sel_sub);
      return SASS_MEMORY_NEW(Boolean, pstate, result);
    }

  }

}