import React, { Component } from "react";
import REC from "react-elm-components";

import ElmMain from "./elm/ElmMain.js";

export default class Graph extends React.Component {
  render() {
    return (
      <div className="time-container">
        <div>
          <REC src={Elm.MyChart} />
        </div>
      </div>
    );
  }
}
