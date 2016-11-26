import React from 'react';
import { withRouter } from 'react-router';

class Search extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      currentOrigin: ""
    };
  }

  handleChange() {
    return e => this.setState({
      currentOrigin: e.currentTarget.value
    });
  }

  onSubmit(e) {
    e.preventDefault();
    console.log(e);
  }



  render() {
    return (
      <div >
        <form>
        <label>Origin</label>
        <input type="text" value={this.state.currentOrigin} onChange={this.handleChange()} />
        <input type="submit" value="New Origin" onClick={this.onSubmit}/>
        </form>

      </div>
    );
  }


}
export default withRouter(Search);
