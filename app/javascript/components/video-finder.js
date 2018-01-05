import Vue from 'vue/dist/vue.common'

const cleanYTUrl = (url) => {
  return url.split("=")[1].substring(0,11);
}

const convertYTDuration = (duration) => {
  var moment = require('moment');
  var x = moment.duration(duration, moment.ISO_8601);
  return x.asSeconds();
}

const fillOutForm = (data) => {
  document.getElementById("video_name").value = data.items[0].snippet.title;
  document.getElementById("video_description").value = data.items[0].snippet.description;
  document.getElementById("video_thumbnail").value = data.items[0].snippet.thumbnails.standard.url;
  const durationInSeconds = convertYTDuration(data.items[0].contentDetails.duration);
  document.getElementById("video_video_duration").value = durationInSeconds;
  const minutes = Math.floor(durationInSeconds / 60);
  const seconds = durationInSeconds - minutes * 60;
  document.getElementById("video_duration").innerText = `${minutes},${seconds} min`;
}

document.addEventListener('DOMContentLoaded', () => {
  if(document.getElementById("video-new")){
    document.body.appendChild(document.createElement('app'));
    var videoNew = new Vue({
      el: '#video-new',
      data: {
        videoUrl: "",
        videoId: "",
        iframeUrl: "",
        error: "",
        displayDefault: true,
        displayResult: false,
      },
      computed: {

      },
      methods: {
        loadVideo: function(e) {
          e.preventDefault();
          var that;
          that = this;
          if(this.videoUrl === "") {
            that.error = "D'abord l'url jeune padawan !"
          } else if(!this.videoUrl.includes("https://www.youtube.com/watch?v=")){
            that.error = "Je ne connais que Youtube, pardon !"
          } else {
            that.error = "";
            that.displayDefault = false;
            that.displayResult = true;
            that.videoId = cleanYTUrl(that.videoUrl);
            document.getElementById("video_url").value = that.videoId;
            that.iframeUrl = `https://www.youtube.com/embed/${that.videoId}`;
            const query = `https://www.googleapis.com/youtube/v3/videos?id=${that.videoId}&key=AIzaSyAdFWsbJNpGY7BwndWGDaOgFRQ8UUrjyAE&part=snippet,contentDetails`;
            fetch(query).then(response => response.json())
                        .then((data) => {
                          fillOutForm(data);
                        })
          }
        },
      }
    })
  }
})
