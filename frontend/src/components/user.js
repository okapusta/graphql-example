import React from "react";
import gql from "graphql-tag";

import { Query, Mutation } from 'react-apollo';
import { Error } from './error';
import { Loading } from './loading';
import { FestivalForm } from './festival/form'

const GET_USER = gql`
  query User($id: Int!) {
    user(id: $id) {
      id
      handle
      email

      festivals {
        id
        name
        place
      }
    }
  }
`;

const ADD_FESTIVAL = gql`
  mutation AddFestival($name: String!, $place: String!, $userId: Int) {
    addFestival(name: $name, place: $place, userId: $userId) {
      festival {
        id
        name
        place
      }
    }
  }
`;

export class User extends React.Component {
  constructor(props) {
    super(props);

    this.userId = Number(props.match.params.id);
  }
  render() {
    return (<Query query = { GET_USER } variables={ { id: this.userId } }>
      {({ loading, error, data }) => {
          if (loading) return <Loading />;
          if (error) return <Error />;

          const user = data.user;

          return (
            <div>
              <h1>{ user.handle }</h1>
              <h3>Add festival</h3>
              <Mutation mutation={ ADD_FESTIVAL }>
                {(addFestival, { data }) => (
                  <FestivalForm onSubmit={ addFestival.bind(this) } userId={ this.userId }/>
                )}
              </Mutation>
              <hr />
              { user.festivals.map((fest) => {
                return (
                  <div key={ fest.id }>{ fest.name } - { fest.place }</div>
                );
              })}
            </div>
          );
        }}
      </Query>
    );
  }
}
