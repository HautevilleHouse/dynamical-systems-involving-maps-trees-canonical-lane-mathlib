import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTrees

structure TreeDynamics where
  tree : Type u
  shift : tree → tree
  topology : TopologicalSpace tree
  shiftContinuous : Prop
  shiftContinuousTerm : shiftContinuous

structure SpecificationPackage (D : TreeDynamics) where
  specificationConstant : ℕ
  separationProperty : ∀ (n : ℕ), ∃ (F : Set D.tree), (∀ x ≠ y ∈ F, d(x,y) > ε) ∧ ...
  approximationProperty : Prop
  specificationConstantTerm : specificationConstant
  separationPropertyTerm : separationProperty
  approximationPropertyTerm : approximationProperty
  
structure SpecificationEvidence {D : TreeDynamics} (S : SpecificationPackage D) where
  separationPropertyClosed : S.separationProperty
  approximationPropertyClosed : S.approximationProperty

def SpecificationClosed {D : TreeDynamics} (S : SpecificationPackage D) : Prop :=
  S.separationProperty ∧ S.approximationProperty

theorem specification_closed_from_evidence {D : TreeDynamics}
    (S : SpecificationPackage D) (E : SpecificationEvidence S) :
    SpecificationClosed S := by
  exact And.intro E.separationPropertyClosed E.approximationPropertyClosed

end DynamicalSystemsInvolvingMapsTrees
end HautevilleHouse