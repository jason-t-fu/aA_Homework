import { ADD_FRUIT, CLEAR } from "./actions";

const _defaultState = {
  fruits: []
};

const Reducer = (oldState = _defaultState, action) => {
  //Should return new state based on old state and action
  switch (action.type) {
    case ADD_FRUIT:
      return {
        fruits: [...oldState.fruits, action.fruit]
      };
    case CLEAR:
      return _defaultState;
    default:
      return oldState;
  }
};

export default Reducer;