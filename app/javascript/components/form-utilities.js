const setActive = (e) => {
  document.querySelector("label[for=intensity1]").classList.remove("active");
  document.querySelector("label[for=intensity2]").classList.remove("active");
  document.querySelector("label[for=intensity3]").classList.remove("active");
  e.currentTarget.classList.add("active");
}

const intensitySelectors = document.querySelectorAll(".intensity-selector");
if(intensitySelectors) {
  intensitySelectors.forEach((selector) => {
    selector.addEventListener('click', setActive)
  })
}

const setVideoDuration = () => {
  const duration = document.getElementById("video_duration")
  if (duration) {
    const durationInSeconds = document.getElementById("video_video_duration").value;
    const minutes = Math.floor(durationInSeconds / 60);
    const seconds = durationInSeconds - minutes * 60;
    duration.innerText = `${minutes},${seconds} min`;
  }
}

setVideoDuration();
