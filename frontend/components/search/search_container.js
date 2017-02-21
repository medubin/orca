import { connect } from 'react-redux';
import Search from './search.jsx';

import { updateOrigin } from '../../'

const mapStateToProps = state => ({
  origin: state
});

const mapDispatchToProps = dispatch => ({
  updateOrigin: (origin) => dispatch(updateOrigin(origin))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Search);
