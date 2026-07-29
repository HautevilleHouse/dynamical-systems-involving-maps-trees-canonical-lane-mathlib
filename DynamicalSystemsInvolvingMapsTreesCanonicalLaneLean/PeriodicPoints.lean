import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean

structure PeriodicPointsPackage (T : TreeIterationPackage) where
  periodSet : Set ℕ
  periodicPointCondition : T.treeType → Prop
  periodicPointsClassified : Prop
  denseOrNotDense : Prop
  periodicPointsClosed : Prop

structure PeriodicPointsEvidence {T : TreeIterationPackage}
    (P : PeriodicPointsPackage T) where
  periodicPointsClassifiedClosed : P.periodicPointsClassified
  denseOrNotDenseClosed : P.denseOrNotDense
  periodicPointsClosedClosed : P.periodicPointsClosed

def PeriodicPointsClosed {T : TreeIterationPackage}
    (P : PeriodicPointsPackage T) : Prop :=
  P.periodicPointsClassified ∧ P.denseOrNotDense ∧ P.periodicPointsClosed

theorem periodic_points_closed_from_evidence {T : TreeIterationPackage}
    (P : PeriodicPointsPackage T) (E : PeriodicPointsEvidence P) :
    PeriodicPointsClosed P := by
  exact And.intro E.periodicPointsClassifiedClosed (And.intro E.denseOrNotDenseClosed E.periodicPointsClosedClosed)

end DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean
end HautevilleHouse