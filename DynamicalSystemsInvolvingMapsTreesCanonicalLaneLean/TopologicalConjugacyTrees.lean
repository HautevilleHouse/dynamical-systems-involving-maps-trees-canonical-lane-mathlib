import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTrees

structure TreeDynamicalSystem where
  tree : Type u
  shiftMap : tree → tree
  topology : TopologicalSpace tree
  shiftContinuous : Prop
  shiftContinuousTerm : shiftContinuous

structure TopologicalConjugacyPackage (S T : TreeDynamicalSystem) where
  conjugacyMap : S.tree → T.tree
  mapContinuous : Prop
  conjugacyEquation : ∀ x, conjugacyMap (S.shiftMap x) = T.shiftMap (conjugacyMap x)
  mapInvertible : ∃ inv : T.tree → S.tree, (inv ∘ conjugacyMap = id) ∧ (conjugacyMap ∘ inv = id)
  mapContinuousTerm : mapContinuous
  conjugacyEquationTerm : ∀ x, conjugacyMap (S.shiftMap x) = T.shiftMap (conjugacyMap x)
  mapInvertibleTerm : mapInvertible

structure TopologicalConjugacyEvidence {S T : TreeDynamicalSystem}
    (C : TopologicalConjugacyPackage S T) where
  mapContinuousClosed : C.mapContinuous
  conjugacyEquationClosed : C.conjugacyEquation
  mapInvertibleClosed : C.mapInvertible

def TopologicalConjugacyClosed {S T : TreeDynamicalSystem}
    (C : TopologicalConjugacyPackage S T) : Prop :=
  C.mapContinuous ∧ C.conjugacyEquation ∧ C.mapInvertible

theorem topological_conjugacy_closed_from_evidence {S T : TreeDynamicalSystem}
    (C : TopologicalConjugacyPackage S T)
    (E : TopologicalConjugacyEvidence C) : TopologicalConjugacyClosed C := by
  exact And.intro E.mapContinuousClosed
    (And.intro E.conjugacyEquationClosed E.mapInvertibleClosed)

end DynamicalSystemsInvolvingMapsTrees
end HautevilleHouse