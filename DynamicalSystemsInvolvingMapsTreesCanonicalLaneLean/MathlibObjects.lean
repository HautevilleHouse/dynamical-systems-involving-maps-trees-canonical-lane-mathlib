import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure MapsTreesSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure MapsTreesTree where
  space : MapsTreesSpace
  vertexSet : Set (MapsTreesSpace.carrier)
  edgeRelation : Prop
  treeTopology : TopologicalSpace (MapsTreesSpace.carrier)

structure MapsTreesMap where
  domain : MapsTreesTree
  codomain : MapsTreesTree
  map : MapsTreesTree.vertexSet → MapsTreesTree.vertexSet
  continuous : Prop

structure MapsTreesAdmittedObject where
  tree : MapsTreesTree
  map : MapsTreesMap
  treeMapCompatibility : Prop
  conclusion : treeMapCompatibility

def MapsTreesWitnessClosed (O : MapsTreesAdmittedObject) : Prop :=
  O.treeMapCompatibility

end DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean
end HautevilleHouse