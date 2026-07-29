import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean

structure TreeDynamicalSystem (X : Type u) where
  tree : List X
  map : X → X
  forwardTrajectory (x : X) : Stream X := Stream.const x
  iterationCompatible : ∀ x, map (forwardTrajectory x).head = (forwardTrajectory (map x)).head
  forwardInvariantSet : Set X
  forwardInvariantClosure : ∀ x, x ∈ forwardInvariantSet → map x ∈ forwardInvariantSet

structure SymbolicSpace (X : Type u) where
  alphabet : List X
  shiftMap : (ℕ → X) → (ℕ → X) := fun s n => s (n+1)
  fullShift : Prop
  subshiftCondition : Prop
  minimality : Prop

structure InvariantMeasure (X : Type u) [MeasurableSpace X] (T : TreeDynamicalSystem X) where
  measure : Measure X
  invariantCondition : ∀ A : Set X, MeasurableSet A → measure A = measure (T.map⁻¹' A)
  ergodicCondition : Prop
  entropy : ℝ

structure TopologicalEntropy (X : Type u) [MetricSpace X] (T : TreeDynamicalSystem X) where
  growthRate : ℕ → ℝ := fun n => log (card (separatedSet n))
  limitExists : Prop
  entropyValue : ℝ
  variationalPrinciple : Prop

def DynamicalMapTreeClosed (X : Type u) (T : TreeDynamicalSystem X) : Prop :=
  T.forwardInvariantClosure (T.forwardInvariantSet.choose) ∧
  T.iterationCompatible (T.forwardInvariantSet.choose)

end DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean
end HautevilleHouse