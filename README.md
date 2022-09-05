# Dott Technical Test

Thank you to the dott team for the opportunity. Below you will find a detailed description of the work that was done.

## Introduction

The following app was written under the MVVM architecture. Additionally I've added several custom layers to take care of providing/managing/filtering the list of vehicles, as well as classes for the service call and the image request/download logic.

I have deleted all .xib files and recreated the view controllers programatically to prevent bloat.

I've also used several of the DottUIKit components (like DottLabel) where applicable.

I did not create a custom cell for the main vehicle list, since it didn't seem necessary from the mocks.

I'm presenting this document as if I was submitting an MR for review.

**IMPORTANT NOTE:** Please do a `pod install` before trying to compile. I have added the "SnapKit" pod for the sake of speed when working with constraints.

## Description

The following features were included in this release:
 
1. Vehicle List screen.

2. Vehicle Filter screen by color.

3. Persistent filter choice between launches using UserDefaults.

4. UI feedback for when filter is active.

5. Vehicle Detail showing its identification number and QR code.

6. Error view that can handle both internal server and connection error messages.

For the error view, a decision was made to present it regardless if it's a connection issue or an internal server issue.

## Functionality

The app will attempt to retrieve a list of vehicles using the provided service. If this attempt succeeds, the list will update autopmatically (filtered if necessary). If the attempt fails, an error view will display for 5 seconds, and the service will be stopped. Users can then "pull to refresh" in order to restart the calls.

If a user "pulls to refresh" before an error occurs, the Observable being used to subscribe to the results will be disposed, and a new one created in its place. This prevents several reloads happening in quick succession causing the service to be called several times. In that case the result could potentially be a Vehicle list that refreshes every half a second or so. This is not the expected functionality.

## Final Notes

- Did not have time to implement `UIPresentationController` for the 50% view. That would have been my choice. Rolling our own view in this case would need to include tap outside to close, drag down to close, and the animatin bounce when keeping your finger on the modal. 
