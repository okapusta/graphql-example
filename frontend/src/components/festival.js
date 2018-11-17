import React from "react";
import gql from "graphql-tag";

import { Query, graphql, compose } from 'react-apollo';

import { FestivalForm } from './festival/form'
import { Error } from './error';
import { Loading } from './loading';

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

const getFestivalQuery = gql`
  query Festival($id: Int) {
    festival(id: $id) {
      id
      name
      place
      artists {
        id
        name
      }
    }
  }
`;

class NewFestival extends React.Component {
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
          window.location.href = `/festival/${data.festival.id}`;
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

class Festival extends React.Component {
  render() {
    const festivalId = Number(this.props.match.params.id);
    return (<Query query = { getFestivalQuery } variables={ { id: festivalId } }>
      {({ loading, error, data }) => {
          if (loading) return <Loading />;
          if (error) return <Error />;

          const festival = data.festival;

          return (
            <div className="container">
              <div className="row">
                <div className="col-md col-sm">
                  <h2>{ festival.name } ({ festival.place })</h2>
                  <hr />
                  Artists:
                </div>
                <div className="col-md col-sm">
                  <h2>Add artist</h2>
                </div>
              </div>
            </div>
          );
        }}
      </Query>);
  }
}

const NewFestivalGraph = graphql(addFestivalMutation)(NewFestival);

export {
   NewFestivalGraph as NewFestival,
   Festival,
};
