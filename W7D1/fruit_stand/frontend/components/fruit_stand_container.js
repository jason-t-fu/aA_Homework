//Connects presentational level to store

import { connect } from 'react-redux';
import { addApple, addOrange, clearFruit } from '../actions';
import FruitStand from './fruit_stand';

//State is available from the Provider on entry.js
const mapStateToProps = (state) => ({
  //Props that get passed to presentation component
  fruits: state.fruits
});

const mapDispatchToProps = (dispatch) => ({
  addApple: () => dispatch(addApple()),
  addOrange: () => dispatch(addOrange()),
  clearFruit: () => dispatch(clearFruit())
});

//Connects FruitStand presentational component to redux store
export default connect(
  mapStateToProps, mapDispatchToProps
)(FruitStand);

//Calling FruitStandContainer runs connect? IDGI