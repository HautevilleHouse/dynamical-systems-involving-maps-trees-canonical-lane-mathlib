import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingMapsTrees.TreeMapsDynamics
import HautevilleHouse.DynamicalSystemsInvolvingMapsTrees.ShiftSpaceTopology

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTrees

structure EntropyVariationalPrinciplePackage where
  dynamicsPkg : TreeMapsDynamicsPackage
  shiftPkg : ShiftSpaceTopologyPackage
  topologicalEntropy : ℝ
  measureTheoreticEntropy : ℝ
  supremumOverInvariantMeasures : Prop
  entropyEquality : Prop

structure EntropyVariationalPrincipleEvidence (P : EntropyVariationalPrinciplePackage) where
  supremumOverInvariantMeasuresClosed : P.supremumOverInvariantMeasures
  entropyEqualityClosed : P.entropyEquality

def EntropyVariationalPrincipleClosed (P : EntropyVariationalPrinciplePackage) : Prop :=
  P.supremumOverInvariantMeasures ∧ P.entropyEquality

theorem entropy_variational_principle_closed_from_evidence (P : EntropyVariationalPrinciplePackage)
    (E : EntropyVariationalPrincipleEvidence P) : EntropyVariationalPrincipleClosed P :=
  And.intro E.supremumOverInvariantMeasuresClosed E.entropyEqualityClosed

end DynamicalSystemsInvolvingMapsTrees
end HautevilleHouse