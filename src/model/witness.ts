import { Facts, FactsObject, VegaLiteSpecDictionaryObject } from "./facts";

export interface WitnessObject {
  costs?: number[];
  facts: FactsObject;
}

export class Witness {
  static toVegaLiteSpecDictionary(
    witness: WitnessObject
  ): VegaLiteSpecDictionaryObject {
    return Facts.toVegaLiteSpecDictionary(witness.facts);
  }
}
