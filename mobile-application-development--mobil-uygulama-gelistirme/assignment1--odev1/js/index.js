/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

// Wait for the deviceready event before using any of Cordova's device APIs.
// See https://cordova.apache.org/docs/en/latest/cordova/events/events.html#deviceready
document.addEventListener("deviceready", onDeviceReady, false);

function onDeviceReady() {
  // Cordova is now initialized. Have fun!

  let doc = window.document;
  let pouch_cordova_element = (doc.createElement("h4").innerText =
    "Cordova 🖤 Mobil Programlama!");
  doc.getElementById("pouch_cordova_title").append(pouch_cordova_element);

  var db = new PouchDB("userapp", { adapter: "cordova-sqlite" });

  doc = {
    _id: "Bozok",
    title: "Bozok Universitesi",
    lecture: "Cordova 🖤 Mobil Programlama Dersi!",
    teacher: "Tolga Hayıt",
    date: "18.04.2021",
    version: "Version 1.0.0",
  };

  db.put(doc)
    .then((res) => {
      console.log("Document inserted OK");
      console.log("res: ", res);
    })
    .catch((err) => {
      console.error(err);
    });

  db.get("Bozok")
    .then(function (doc) {
      console.log("🚀 ~ file: index.js ~ line 54 ~ doc", doc);
      let docum = window.document;
      let title = (docum.createElement("h4").innerText = doc.title);
      let lecture = (docum.createElement("h4").innerText = doc.lecture);
      let teacher = (docum.createElement("h4").innerText = doc.teacher);
      let date = (docum.createElement("h4").innerText = doc.date);
      let version = (docum.createElement("h4").innerText = doc.version);
      let element_arr = [title, lecture, teacher, date, version];

      element_arr.forEach((item) => {
        console.log(
          "🚀 ~ file: index.js ~ line 63 ~ element_arr.forEach ~ item",
          item
        );
        let pouch_cordova_ul = document.getElementById("pouch_cordova_ul");
        let li = document.createElement("li");
        let txt = document.createTextNode(item);
        li.appendChild(txt);
        pouch_cordova_ul.appendChild(li);
      });
    })
    .catch(function (err) {
      console.log(err);
    });

  console.log("Running cordova-" + cordova.platformId + "@" + cordova.version);
  document.getElementById("deviceready").classList.add("ready");
}
