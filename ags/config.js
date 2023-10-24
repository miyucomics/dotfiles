import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";
import Audio from "resource:///com/github/Aylur/ags/service/audio.js";
import App from "resource:///com/github/Aylur/ags/app.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";
import {exec, execAsync} from "resource:///com/github/Aylur/ags/utils.js";

const Clock = Widget.Label({
  className: "clock",
  connections: [[1000, self => (self.label = exec("date +%H:%M"))]]
});

const Workspaces = Widget.Box({
  className: "workspaces",
  connections: [
    [
      Hyprland.active.workspace,
      self => {
        self.children = [1, 2, 3, 4, 5, 6, 7, 8, 9].map(i =>
          Widget.Button({
            child: Widget.Label(`${i}`),
            onClicked: () => execAsync(`hyprctl dispatch workspace ${i}`),
            className: Hyprland.active.workspace.id == i ? "focused" : ""
          })
        );
      }
    ]
  ]
});

const ClientTitle = Widget.Label({
  className: "client-title",
  binds: [["label", Hyprland.active.client, "title"]]
});

const Volume = Widget.Label({
  className: "volume",
  connections: [
    [
      Audio,
      self => {
        self.label = Math.round(Audio.speaker.volume * 100).toString() + "%";
      },
      "speaker-changed"
    ]
  ]
});

const Left = Widget.Box({
  children: [Clock, Workspaces]
});

const Center = Widget.Box({
  children: [ClientTitle]
});

const Right = Widget.Box({
  halign: "end",
  children: [Volume]
});

const Bar = Widget.Window({
  name: "bar",
  className: "bar",
  exclusive: true,
  anchor: ["top", "left", "right"],
  child: Widget.CenterBox({
    startWidget: Left,
    centerWidget: Center,
    endWidget: Right,
    className: "container"
  })
});

export default {
  style: App.configDir + "/style.css",
  windows: [Bar]
};
