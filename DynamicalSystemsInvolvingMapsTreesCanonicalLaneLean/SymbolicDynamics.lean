import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean

structure SubshiftPackage (T : MapsTreesTree) where
  alphabet : Set (T.vertexSet)
  shiftInvariant : Set (ℕ → T.vertexSet)
  treeConstraint : Prop
  soficProperty : Prop

def SubshiftClosed {T : MapsTreesTree} (S : SubshiftPackage T) : Prop :=
  S.treeConstraint ∧ S.soficProperty

structure SubshiftEvidence {T : MapsTreesTree} (S : SubshiftPackage T) where
  treeConstraintClosed : S.treeConstraint
  soficPropertyClosed : S.soficProperty

theorem subshift_closed_from_evidence {T : MapsTreesTree}
    (S : SubshiftPackage T) (E : SubshiftEvidence S) : SubshiftClosed S := by
  exact And.intro E.treeConstraintClosed E.soficPropertyClosed

end DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean
end HautevilleHouse