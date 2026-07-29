import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean

structure ErgodicMeasure (X : Type u) [MeasurableSpace X] (T : TreeDynamicalSystem X) where
  underlyingMeasure : InvariantMeasure X T
  ergodicCondition : ∀ A : Set X, MeasurableSet A → (T.map⁻¹' A = A) → (underlyingMeasure.measure A = 0 ∨ underlyingMeasure.measure A = 1)
  mixingProperty : Prop
  bernoulliProperty : Prop

structure UniqueErgodicity (X : Type u) [MeasurableSpace X] (T : TreeDynamicalSystem X) where
  onlyOneERgodicMeasure : ∃! μ : InvariantMeasure X T, μ.ergodicCondition (Set.univ) (MeasurableSet.univ) (by simp)
  uniqueMeasure : Prop

def ergodic_closure (X : Type u) [MeasurableSpace X] (T : TreeDynamicalSystem X) (E : ErgodicMeasure X T) : Prop :=
  E.ergodicCondition Set.univ MeasurableSet.univ (by intro x; simp) ∧ E.mixingProperty

theorem ergodic_closed_from_evidence (X : Type u) [MeasurableSpace X] (T : TreeDynamicalSystem X) (E : ErgodicMeasure X T) (herg : E.ergodicCondition Set.univ MeasurableSet.univ (by intro x; simp)) (hmix : E.mixingProperty) : ergodic_closure X T E := by
  exact And.intro herg hmix

end DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean
end HautevilleHouse