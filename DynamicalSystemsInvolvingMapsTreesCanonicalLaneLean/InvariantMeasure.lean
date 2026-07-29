import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean

structure InvariantMeasurePackage (T : TreeIterationPackage) where
  measureSpace : Type u
  measure : T.treeType → Prop
  invarianceUnderMap : Prop
  invarianceClosed : Prop

structure InvariantMeasureEvidence {T : TreeIterationPackage}
    (M : InvariantMeasurePackage T) where
  invarianceClosedClosed : M.invarianceClosed

def InvariantMeasureClosed {T : TreeIterationPackage}
    (M : InvariantMeasurePackage T) : Prop :=
  M.invarianceClosed

theorem invariant_measure_closed_from_evidence {T : TreeIterationPackage}
    (M : InvariantMeasurePackage T) (E : InvariantMeasureEvidence M) :
    InvariantMeasureClosed M := by
  exact E.invarianceClosedClosed

end DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean
end HautevilleHouse