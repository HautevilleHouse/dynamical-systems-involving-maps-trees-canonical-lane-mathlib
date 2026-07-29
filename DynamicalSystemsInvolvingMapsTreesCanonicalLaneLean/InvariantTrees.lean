import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTrees

structure TreeSymbolSpace where
  alphabet : Type u
  shiftMap : alphabet → alphabet
  shiftContinuity : Prop
  shiftContinuityTerm : shiftContinuity

structure InvariantTreePackage (A : TreeSymbolSpace) where
  treeInclusion : A.alphabet → Prop
  invariance : ∀ x, treeInclusion x → treeInclusion (A.shiftMap x)
  minimality : Prop
  topologicalTransitivity : Prop
  invarianceTerm : ∀ x, treeInclusion x → treeInclusion (A.shiftMap x)
  minimalityTerm : minimality
  topologicalTransitivityTerm : topologicalTransitivity

structure InvariantTreeEvidence {A : TreeSymbolSpace} (P : InvariantTreePackage A) where
  invarianceClosed : P.invariance
  minimalityClosed : P.minimality
  topologicalTransitivityClosed : P.topologicalTransitivity

def InvariantTreeClosed {A : TreeSymbolSpace} (P : InvariantTreePackage A) : Prop :=
  (∀ x, P.treeInclusion x → P.treeInclusion (A.shiftMap x)) ∧
  P.minimality ∧ P.topologicalTransitivity

theorem invariant_tree_closed_from_evidence {A : TreeSymbolSpace}
    (P : InvariantTreePackage A) (E : InvariantTreeEvidence P) :
    InvariantTreeClosed P := by
  exact And.intro E.invarianceClosed
    (And.intro E.minimalityClosed E.topologicalTransitivityClosed)

end DynamicalSystemsInvolvingMapsTrees
end HautevilleHouse