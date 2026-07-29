import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean

structure IterationPackage (T : MapsTreesTree) (f : MapsTreesMap) where
  iterates : ℕ → (T.vertexSet → T.vertexSet)
  periodicPoints : Set T.vertexSet
  recurrentPoints : Set T.vertexSet
  mixingProperty : Prop
  entropy : ℝ

def IterationClosed {T : MapsTreesTree} {f : MapsTreesMap} (P : IterationPackage T f) : Prop :=
  P.mixingProperty ∧ P.entropy ≥ 0

structure IterationEvidence {T : MapsTreesTree} {f : MapsTreesMap} (P : IterationPackage T f) where
  mixingPropertyClosed : P.mixingProperty
  entropyNonNegative : P.entropy ≥ 0

theorem iteration_closed_from_evidence {T : MapsTreesTree} {f : MapsTreesMap}
    (P : IterationPackage T f) (E : IterationEvidence P) : IterationClosed P := by
  exact And.intro E.mixingPropertyClosed E.entropyNonNegative

end DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean
end HautevilleHouse