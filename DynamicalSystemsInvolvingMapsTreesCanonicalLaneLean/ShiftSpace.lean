import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean

structure FullShiftSpace (A : Type u) where
  alphabet : A
  shiftInvariance : Prop
  orbitStructure : Prop

def SymbolicShiftClosed (S : FullShiftSpace) : Prop :=
  S.shiftInvariance ∧ S.orbitStructure

theorem symbolicshift_closed_from_evidence (S : FullShiftSpace) (hshift : S.shiftInvariance) (horbit : S.orbitStructure) : SymbolicShiftClosed S := by
  exact And.intro hshift horbit

structure SubshiftOfFiniteType (A : Type u) (S : FullShiftSpace A) where
  adjacencyMatrix : Matrix ℕ ℕ Bool
  allowedWords : List A → Prop
  forbbidenPatterns : List A
  finiteTypeCondition : ∀ w, allowedWords w ↔ ∀ i, ¬(forbbidenPatterns ⊆ List.take (length forbbidenPatterns) (drop i w))
  topologicalEntropy : ℝ
  mixingProperty : Prop

def subshift_closed (A : Type u) (S : FullShiftSpace A) (T : SubshiftOfFiniteType A S) : Prop :=
  T.finiteTypeCondition (List.iota 0) ∧ T.mixingProperty

end DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean
end HautevilleHouse