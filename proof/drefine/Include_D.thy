(*
 * Copyright 2014, NICTA
 *
 * This software may be distributed and modified according to the terms of
 * the GNU General Public License version 2. Note that NO WARRANTY is provided.
 * See "LICENSE_GPLv2.txt" for details.
 *
 * @TAG(NICTA_GPL)
 *)

(* 
 * Base theory for capDL refinement.
 *
 * Includes relevant parts from capDL spec and abstract -> Haskell refinement.
 *)

theory Include_D
imports
  "../../spec/capDL/Syscall_D"
  "../refine/Refine"
  "../../lib/MonadicRewrite"
begin

(* FIXME: Refine may be a bit much. Might want to tease out
          abstract-only parts *)

end
