#ifndef SASS_FN_UTILS_H
#define SASS_FN_UTILS_H
#include "units.hpp"
#include "backtrace.hpp"
#include "environment.hpp"
#include "ast_fwd_decl.hpp"
#include "error_handling.hpp"

namespace Sass {

  #define FN_PROTOTYPE \
    Env& env, \
    Env& d_env, \
    Context& ctx, \
    Signature sig, \
    ParserState pstate, \
    Backtraces& traces, \
    SelectorStack& selector_stack

  typedef const char* Signature;
  typedef PreValue_Ptr (*Native_Function)(FN_PROTOTYPE);
  #define BUILT_IN(name) PreValue_Ptr name(FN_PROTOTYPE)

  #define ARG(argname, argtype) get_arg<argtype>(argname, env, sig, pstate, traces)
  // special function for weird hsla percent (10px == 10% == 10 != 0.1)
  #define ARGVAL(argname) get_arg_val(argname, env, sig, pstate, traces) // double

  Definition_Ptr make_native_function(Signature, Native_Function, Context& ctx);
  Definition_Ptr make_c_function(Sass_Function_Entry c_func, Context& ctx);

  namespace Functions {

    template <typename T>
    T* get_arg(const std::string& argname, Env& env, Signature sig, ParserState pstate, Backtraces traces)
    {
      T* val = Cast<T>(env[argname]);
      if (!val) {
        std::string msg("argument `");
        msg += argname;
        msg += "` of `";
        msg += sig;
        msg += "` must be a ";
        msg += T::type_name();
        error(msg, pstate, traces);
      }
      return val;
    }

    Map_Ptr get_arg_m(const std::string& argname, Env& env, Signature sig, ParserState pstate, Backtraces traces); // maps only
    Number_Ptr get_arg_n(const std::string& argname, Env& env, Signature sig, ParserState pstate, Backtraces traces); // numbers only
    double alpha_num(const std::string& argname, Env& env, Signature sig, ParserState pstate, Backtraces traces); // colors only
    double color_num(const std::string& argname, Env& env, Signature sig, ParserState pstate, Backtraces traces); // colors only
    double get_arg_r(const std::string& argname, Env& env, Signature sig, ParserState pstate, Backtraces traces, double lo, double hi); // colors only
    double get_arg_val(const std::string& argname, Env& env, Signature sig, ParserState pstate, Backtraces traces); // shared
    Selector_List_Obj get_arg_sels(const std::string& argname, Env& env, Signature sig, ParserState pstate, Backtraces traces, Context& ctx); // selectors only
    Compound_Selector_Obj get_arg_sel(const std::string& argname, Env& env, Signature sig, ParserState pstate, Backtraces traces, Context& ctx); // selectors only

  }

}

#endif
