// Selection of intensity fields
const intensityInputs = document.querySelectorAll(".inline-intensity input[type=radio]");

function setActive(inputs) {
  inputs.forEach((input) => {
    if(input.checked) {
      input.parentElement.querySelector("label").classList.add("active");
    }
  })
}

if (intensityInputs) {
 $(document).ready(function(){
    setActive(intensityInputs);
    $(".collection_radio_buttons").click(function(){
      $(".collection_radio_buttons").removeClass("active");
      $(this).addClass("active");
    })
  })
}

// Selection of zone fields
const zoneSelectors = document.querySelectorAll(".inline-zone input[type=checkbox]");

if (zoneSelectors) {
 $(document).ready(function(){
    setActive(zoneSelectors);
    $(".collection_check_boxes").click(function(){
      $(this).toggleClass("active");
    })
  })
}

// Parse the youtube duration in normal people duration
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
