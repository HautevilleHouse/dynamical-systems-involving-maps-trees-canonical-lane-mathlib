import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean

structure SensitivityPackage (T : TreeIterationPackage) where
  sensitiveToInitialConditions : Prop
  expansivityProperty : Prop
  sensitivityClosed : Prop

structure SensitivityEvidence {T : TreeIterationPackage}
    (S : SensitivityPackage T) where
  sensitiveToInitialConditionsClosed : S.sensitiveToInitialConditions
  expansivityPropertyClosed : S.expansivityProperty
  sensitivityClosedClosed : S.sensitivityClosed

def SensitivityClosed {T : TreeIterationPackage}
    (S : SensitivityPackage T) : Prop :=
  S.sensitiveToInitialConditions ∧ S.expansivityProperty ∧ S.sensitivityClosed

theorem sensitivity_closed_from_evidence {T : TreeIterationPackage}
    (S : SensitivityPackage T) (E : SensitivityEvidence S) :
    SensitivityClosed S := by
  exact And.intro E.sensitiveToInitialConditionsClosed (And.intro E.expansivityPropertyClosed E.sensitivityClosedClosed)

end DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean
end HautevilleHouse