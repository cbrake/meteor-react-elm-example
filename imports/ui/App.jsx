import React from "react";
import Hello from "./Hello.jsx";
import Info from "./Info.jsx";
import Chart from "./Chart.jsx";
import REC from "react-elm-components";

// The below imports the Elm runtime as a global.
// You can then use any of the Elm modules.
import ElmMain from "./elm/ElmMain.js";

const App = () => (
  <div>
    <h1>Welcome to Meteor!</h1>
    <Hello />
    <h3>Start Elm Stuff</h3>
    <Chart />
    <REC src={Elm.Button} />
    <h3>End Elm Stuff</h3>
    <Info />
  </div>
);

export default App;
