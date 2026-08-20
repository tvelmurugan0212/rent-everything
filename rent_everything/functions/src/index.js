const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

const db = admin.firestore();
const messaging = admin.messaging();

exports.sendBookingNotification = functions.firestore
    .document("bookings/{bookingId}")
    .onCreate(async (snap, context) => {
      const booking = snap.data();
      const ownerId = booking.ownerId;

      if (!ownerId) {
        console.log("No ownerId in booking, skipping notification");
        return null;
      }

      try {
        const ownerDoc = await db.collection("users").doc(ownerId).get();

        if (!ownerDoc.exists) {
          console.log(`Owner ${ownerId} not found`);
          return null;
        }

        const fcmToken = ownerDoc.data().fcmToken;

        if (!fcmToken) {
          console.log(`Owner ${ownerId} has no FCM token`);
          return null;
        }

        const payload = {
          notification: {
            title: "New Booking Received!",
            body: `Your item "${booking.productName}" has been booked.`,
          },
          data: {
            bookingId: context.params.bookingId,
            productName: booking.productName || "",
            type: "new_booking",
          },
          token: fcmToken,
        };

        await messaging.send(payload);
        console.log(`Notification sent to owner ${ownerId}`);

        return null;
      } catch (error) {
        console.error("Error sending notification:", error);
        return null;
      }
    });
