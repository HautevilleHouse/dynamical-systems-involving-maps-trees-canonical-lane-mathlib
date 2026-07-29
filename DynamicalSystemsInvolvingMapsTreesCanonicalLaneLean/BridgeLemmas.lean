import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MapsTreesWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean
end HautevilleHouse