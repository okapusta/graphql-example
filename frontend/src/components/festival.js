import React from "react";
import gql from "graphql-tag";

import { graphql, compose } from 'react-apollo';

import { FestivalForm } from './festival/form'

const addFestivalMutation = gql`
  mutation AddFestival($name: String!, $place: String!, $userId: Int) {
    addFestival(name: $name, place: $place, userId: $userId) {
      festival {
        id
        name
        place
      }
      errors
    }
  }
`;

export class NewFestival extends React.Component {
  constructor(props) {
    super(props);
    this.formRef = React.createRef();
  }

  onSubmit(data) {
    this.formRef.current.clearValidationErrors();
    this.props.mutate(data)
      .then((response) => {
        const data = response.data.addFestival;
        if (data.errors.length) {
          this.formRef.current.displayValidationErrors(data.errors);
        } else {
          console.log('resp', resp);
        }
    });
  }

  render() {
    return (
      <React.Fragment>
        <h3>Add new festival</h3>
        <FestivalForm onSubmit={ this.onSubmit.bind(this) } ref={ this.formRef }/>
      </React.Fragment>
    );
  }
}

export default graphql(addFestivalMutation)(NewFestival);
