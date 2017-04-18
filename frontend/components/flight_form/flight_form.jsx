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
        <div key={key}>
          <label>
            Location:
            <input type='text' field='location' value={this.state.users[key]['location']} onChange={(e) => this.update(key, 'location', e)}/>
          </label>
            <label>
              Budget:
              <input type='text' field='location' value={this.state.users[key]['budget']} onChange={(e) => this.update(key, 'budget', e)}/>
            </label>
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
    console.log(this.state)
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
      <div>
        <div>
          {this.renderForm()}
        </div>
        <div>
          <button onClick={this.addUser}>Add User</button>
        </div>
      </div>
    )
  }
}

export default FlightForm;
