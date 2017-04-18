import React from 'react';
import { Link, withRouter } from 'react-router';
import merge from 'lodash/merge';

class FlightForm extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
      users: [
        {
        location: "",
        budget: ""
        }
      ]
    };
    this.update = this.update.bind(this)
    this.addUser = this.addUser.bind(this)

  }

	update(key, field, e) {
    let users = this.state.users
    users[key][field] = e.currentTarget.value
		this.setState({
			users: users
		});
	}

  handleSubmit(e) {
    e.preventDefault();
  }

  renderForm() {
    let forms = []
    for(let key in this.state.users) {
      forms.push(
        <div className='row' key={key}>
          <div className="input-field col s4">
            <label>Location</label>
            <input className="validate" type='text' id={'location' + key}  value={this.state.users[key]['location']} onChange={(e) => this.update(key, 'location', e)} />


          </div>

          <div className="input-field col s4">
            <label>Budget</label>
              <input className='validate' type='text' value={this.state.users[key]['budget']} onChange={(e) => this.update(key, 'budget', e)} />
          </div>
        </div>
      )
    }
    return forms
  }

  addUser() {
    let users = this.state.users
    users.push({
      location: "",
      budget: ""
    })

    this.setState({users: users})
  }





  // renderErrors() {
  //   return(
  //     <ul>
  //       {this.props.errors.map((error, i) => (
  //         <li key={`error-${i}`}>
  //           {error}
  //         </li>
  //       ))}
  //     </ul>
  //   );
  // }

  render() {
    return (
      <div className = 'row'>
        <div className='row'>
          <form className="col s12">
            {this.renderForm()}
          </form>
        </div>
        <div className='row'>
          <div className = 'col s12'>
            <button onClick={this.addUser}>Add User</button>
          </div>
        </div>
      </div>
    )
  }
}

export default FlightForm;
