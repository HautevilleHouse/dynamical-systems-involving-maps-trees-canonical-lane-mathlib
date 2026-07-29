import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTrees

structure ShiftSpace where
  tree : Type u
  shiftMap : tree → tree
  topology : TopologicalSpace tree
  shiftContinuous : Prop
  shiftContinuousTerm : shiftContinuous

structure ShiftInvariantMeasurePackage (S : ShiftSpace) where
  probabilityMeasure : Type v
  pushforward : probabilityMeasure → probabilityMeasure
  invarianceCondition : ∀ (μ : probabilityMeasure), pushforward μ = μ
  ergodicityOption : Prop
  invarianceConditionTerm : ∀ (μ : probabilityMeasure), pushforward μ = μ
  ergodicityOptionTerm : ergodicityOption

structure ShiftInvariantMeasureEvidence {S : ShiftSpace}
    (M : ShiftInvariantMeasurePackage S) where
  invarianceConditionClosed : M.invarianceCondition
  ergodicityOptionClosed : M.ergodicityOption

def ShiftInvariantMeasureClosed {S : ShiftSpace}
    (M : ShiftInvariantMeasurePackage S) : Prop :=
  M.invarianceCondition ∧ M.ergodicityOption

theorem shift_invariant_measure_closed_from_evidence
    {S : ShiftSpace} (M : ShiftInvariantMeasurePackage S)
    (E : ShiftInvariantMeasureEvidence M) : ShiftInvariantMeasureClosed M := by
  exact And.intro E.invarianceConditionClosed E.ergodicityOptionClosed

end DynamicalSystemsInvolvingMapsTrees
end HautevilleHouse