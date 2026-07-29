import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean

structure InvariantSet (X : Type u) (T : TreeDynamicalSystem X) where
  set : Set X
  invariance : ∀ x ∈ set, T.map x ∈ set
  minimality : Prop := False
  attractorProperty : Prop := False

structure ChainRecurrentSet (X : Type u) (T : TreeDynamicalSystem X) where
  chainRecurrentPoints : Set X
  chainRecurrence : Prop
  containsPeriodicPoints : Prop
  closureProperty : closure chainRecurrentPoints = chainRecurrentPoints

def invariantset_closed (X : Type u) (T : TreeDynamicalSystem X) (I : InvariantSet X T) : Prop :=
  I.invariance (I.set.choose) ∧ (I.minimality ∨ I.attractorProperty)

theorem invariantset_closed_from_evidence (X : Type u) (T : TreeDynamicalSystem X) (I : InvariantSet X T) (hinv : I.invariance (I.set.choose)) (hmin : I.minimality) (hatt : I.attractorProperty) : invariantset_closed X T I := by
  refine And.intro hinv (Or.inl hmin)

theorem invariantset_closed_from_attractor (X : Type u) (T : TreeDynamicalSystem X) (I : InvariantSet X T) (hinv : I.invariance (I.set.choose)) (hatt : I.attractorProperty) : invariantset_closed X T I := by
  refine And.intro hinv (Or.inr hatt)

end DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean
end HautevilleHouse