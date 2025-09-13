import { Controller } from '@hotwired/stimulus';
import { createConsumer } from '@rails/actioncable';

export default class extends Controller {
  static targets = ['vehicles'];

  connect() {
    console.log('VehicleController connected');
    this.consumer = createConsumer();
    this.setupSubscription();
  }

  disconnect() {
    if (this.subscription) {
      this.subscription.unsubscribe();
    }
  }

  setupSubscription() {
    const query = `
      subscription NewCar {
        newCar {
          car {
            id
            model
            brand {
              id
              name
            }
          }
        }
      }
    `;

    this.subscription = this.consumer.subscriptions.create('GraphqlChannel', {
      connected: () => {
        this.subscription.perform('execute', {
          query: query,
          variables: {},
        });
      },

      received: (data) => {
        if (
          data.result &&
          data.result.data.newCar &&
          data.result.data.newCar.car
        ) {
          this.appendVehicle(data.result.data.newCar.car);
        }
      },
    });
  }

  appendVehicle(vehicle) {
    const vehicleHTML = `
      <div class="vehicle">
        <span><strong>Brand:</strong>${vehicle.brand.name}</span>
        <span><strong>Model:</strong>${vehicle.model}</span>
      </div>
    `;
    this.vehiclesTarget.insertAdjacentHTML('beforeend', vehicleHTML);
    this.vehiclesTarget.scrollTop = this.vehiclesTarget.scrollHeight;
  }
}
