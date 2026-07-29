import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean

structure TreeMapPackage where
  tree : Type u
  map : tree → tree
  topology : TopologicalSpace tree
  continuousMap : Continuous map
  invariantMeasures : Prop
  entropy : ℝ

structure TreeMapEvidence (T : TreeMapPackage) where
  continuousMapClosed : Continuous T.map
  invariantMeasuresClosed : T.invariantMeasures
  entropyClosed : True

def TreeMapClosed (T : TreeMapPackage) : Prop :=
  Continuous T.map ∧ T.invariantMeasures ∧ True

theorem tree_map_closed_from_evidence (T : TreeMapPackage) (E : TreeMapEvidence T) : TreeMapClosed T := by
  exact And.intro E.continuousMapClosed (And.intro E.invariantMeasuresClosed E.entropyClosed)

end DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean
end HautevilleHouse