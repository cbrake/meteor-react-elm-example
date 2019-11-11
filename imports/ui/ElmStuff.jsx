import React, { Component } from "react";
import REC from "react-elm-components";

import ElmMain from "./elm/ElmMain.js";

export default class Graph extends React.Component {
  render() {
    return (
      <div className="time-container">
        <div>
          <h3>Start Elm Stuff</h3>
          <REC src={Elm.MyChart} />
          <REC src={Elm.Button} />
          <h3>End Elm Stuff</h3>
        </div>
      </div>
    );
  }
}
