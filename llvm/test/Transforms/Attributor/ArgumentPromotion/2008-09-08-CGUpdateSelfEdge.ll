; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --function-signature --scrub-attributes
; RUN: opt -disable-output -passes=attributor -aa-pipeline='basic-aa' -attributor-disable=false -attributor-max-iterations-verify -attributor-max-iterations=1 < %s

define internal fastcc i32 @term_SharingList(i32* %Term, i32* %List) nounwind {
entry:
  br i1 false, label %bb, label %bb5

bb:		; preds = %entry
  %0 = call fastcc i32 @term_SharingList( i32* null, i32* %List ) nounwind		; <i32> [#uses=0]
  unreachable

bb5:		; preds = %entry
  ret i32 0
}

define i32 @term_Sharing(i32* %Term) nounwind {
entry:
  br i1 false, label %bb.i, label %bb14

bb.i:		; preds = %entry
  %0 = call fastcc i32 @term_SharingList( i32* null, i32* null ) nounwind		; <i32> [#uses=0]
  ret i32 1

bb14:		; preds = %entry
  ret i32 0
}
