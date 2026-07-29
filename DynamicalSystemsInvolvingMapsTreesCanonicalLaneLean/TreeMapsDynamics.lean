import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTrees

structure TreeMapsDynamicsPackage where
  treeType : Type u
  mapFamily : treeType → treeType
  invariantSubtree : treeType → Prop
  symbolicEncoding : Prop
  entropyWellDefined : Prop

structure TreeMapsDynamicsEvidence (P : TreeMapsDynamicsPackage) where
  invariantSubtreeClosed : P.invariantSubtree P.treeType
  symbolicEncodingClosed : P.symbolicEncoding
  entropyWellDefinedClosed : P.entropyWellDefined

def TreeMapsDynamicsClosed (P : TreeMapsDynamicsPackage) : Prop :=
  P.symbolicEncoding ∧ P.entropyWellDefined

theorem tree_maps_dynamics_closed_from_evidence (P : TreeMapsDynamicsPackage)
    (E : TreeMapsDynamicsEvidence P) : TreeMapsDynamicsClosed P :=
  And.intro E.symbolicEncodingClosed E.entropyWellDefinedClosed

end DynamicalSystemsInvolvingMapsTrees
end HautevilleHouse