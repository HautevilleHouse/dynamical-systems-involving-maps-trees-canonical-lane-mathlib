import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean

structure EntropyPackage (T : MapsTreesTree) (f : MapsTreesMap) where
  topologicalEntropyDefined : Prop
  measureEntropyDefined : Prop
  variationalPrinciple : Prop
  entropyBounds : Prop

def EntropyClosed {T : MapsTreesTree} {f : MapsTreesMap} (E : EntropyPackage T f) : Prop :=
  E.topologicalEntropyDefined ∧ E.measureEntropyDefined ∧
  E.variationalPrinciple ∧ E.entropyBounds

structure EntropyEvidence {T : MapsTreesTree} {f : MapsTreesMap} (E : EntropyPackage T f) where
  topologicalEntropyClosed : E.topologicalEntropyDefined
  measureEntropyClosed : E.measureEntropyDefined
  variationalPrincipleClosed : E.variationalPrinciple
  entropyBoundsClosed : E.entropyBounds

theorem entropy_closed_from_evidence {T : MapsTreesTree} {f : MapsTreesMap}
    (E : EntropyPackage T f) (Ev : EntropyEvidence E) : EntropyClosed E := by
  exact And.intro Ev.topologicalEntropyClosed
    (And.intro Ev.measureEntropyClosed
      (And.intro Ev.variationalPrincipleClosed Ev.entropyBoundsClosed))

end DynamicalSystemsInvolvingMapsTreesCanonicalLaneLean
end HautevilleHouse