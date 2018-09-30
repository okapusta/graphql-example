import React from "react";

export class FestivalForm extends React.Component {
  constructor(props) {
    super(props);

    this.handleSubmit = this.handleSubmit.bind(this);
    this.state = {
      name: '',
      place: '',
      userId: props.userId,
    };
  }

  handleSubmit(event) {
    event.preventDefault();

    this.props.onSubmit({ variables: this.state });
  }

  handleChange(field, event) {
    const newState = {};
    const value = event.target.value;

    newState[field] = value;

    this.setState(newState);
  }

  render() {
    const name = this.state.name;
    const place = this.state.place;

    return (
      <form onSubmit={ this.handleSubmit }>
        <label htmlFor="name">
          Name
          <input id="name" value={ name } onChange={ (e) => this.handleChange('name', e) } />
        </label>
        <label htmlFor="place">
          Place
          <input id="place" value={ place } onChange={ (e) => this.handleChange('place', e) } />
        </label>
        <input type="submit" value="Submit" />
      </form>
    );
  }
}
