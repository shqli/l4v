(*
 * Copyright 2020, Data61, CSIRO (ABN 41 687 119 230)
 *
 * SPDX-License-Identifier: BSD-2-Clause
 *)

(*
 * Accessing nested structs.
 * Testcase for bug VER-321.
 *)
theory nested_struct imports "AutoCorres.AutoCorres" begin

external_file "nested_struct.c"
install_C_file "nested_struct.c"
(* Nested struct translation currently only works for packed_type types. *)
instance s1_C :: array_outer_packed by intro_classes auto
instance s3_C :: array_outer_packed by intro_classes auto
autocorres "nested_struct.c"

context nested_struct begin



thm f'_def test'_def

lemma "\<lbrace> \<lambda>s. is_valid_point1_C s p1 \<and> is_valid_point2_C s p2 \<rbrace>
         test' p1 p2
       \<lbrace> \<lambda>_ s. num_C.n_C (point1_C.x_C (heap_point1_C s p1)) =
                 index (point2_C.n_C (heap_point2_C s p2)) 0 \<rbrace>!"
  unfolding test'_def f'_def
  apply wp
  apply (clarsimp simp: fun_upd_apply)
  done



thm g'_def

lemma "\<lbrace> \<lambda>h. is_valid_s4_C h s \<and>
             s1_C.x_C (index (s2_C.x_C (s3_C.x_C (index (s4_C.x_C (heap_s4_C h s)) 0))) 0) = v \<rbrace>
         g' s
       \<lbrace> \<lambda>_ h. index (s4_C.x_C (heap_s4_C h s)) 0 = index (s4_C.x_C (heap_s4_C h s)) 1 \<and>
               s3_C.x_C (index (s4_C.x_C (heap_s4_C h s)) 0) = s3_C.y_C (index (s4_C.x_C (heap_s4_C h s)) 0) \<and>
               index (s2_C.x_C (s3_C.x_C (index (s4_C.x_C (heap_s4_C h s)) 0))) 0 =
                 index (s2_C.x_C (s3_C.x_C (index (s4_C.x_C (heap_s4_C h s)) 0))) 1 \<and>
               s1_C.x_C (index (s2_C.x_C (s3_C.x_C (index (s4_C.x_C (heap_s4_C h s)) 0))) 0) =
                 s1_C.y_C (index (s2_C.x_C (s3_C.x_C (index (s4_C.x_C (heap_s4_C h s)) 0))) 0) \<and>
               s1_C.x_C (index (s2_C.x_C (s3_C.x_C (index (s4_C.x_C (heap_s4_C h s)) 0))) 0) = v
       \<rbrace>!"
  unfolding g'_def
  apply wp
  apply (clarsimp simp: fun_upd_apply)
  done

end

end
