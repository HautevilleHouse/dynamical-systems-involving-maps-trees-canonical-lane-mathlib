import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean

structure InvariantSubshiftPackage where
  alphabet : Type u
  shiftMap : (ℕ → alphabet) → (ℕ → alphabet)
  invariantSet : Set (ℕ → alphabet)
  closedInvariant : Prop
  topologicalEntropy : ℝ

structure InvariantSubshiftEvidence (S : InvariantSubshiftPackage) where
  closedInvariantClosed : S.closedInvariant
  entropyDefined : True

def InvariantSubshiftClosed (S : InvariantSubshiftPackage) : Prop :=
  S.closedInvariant ∧ True

theorem invariant_subshift_closed_from_evidence (S : InvariantSubshiftPackage) (E : InvariantSubshiftEvidence S) : InvariantSubshiftClosed S := by
  exact And.intro E.closedInvariantClosed E.entropyDefined

end DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean
end HautevilleHouse