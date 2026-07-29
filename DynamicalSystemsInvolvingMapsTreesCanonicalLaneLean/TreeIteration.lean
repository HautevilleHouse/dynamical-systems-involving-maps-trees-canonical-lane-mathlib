import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean

structure TreeIterationPackage where
  treeType : Type u
  map : treeType → treeType
  initialPoint : treeType
  iterationClosed : Prop

structure TreeIterationEvidence (T : TreeIterationPackage) where
  iterationClosedClosed : T.iterationClosed

def TreeIterationClosed (T : TreeIterationPackage) : Prop :=
  T.iterationClosed

theorem tree_iteration_closed_from_evidence (T : TreeIterationPackage)
    (E : TreeIterationEvidence T) : TreeIterationClosed T := by
  exact E.iterationClosedClosed

end DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean
end HautevilleHouse