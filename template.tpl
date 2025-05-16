___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "webePartners",
  "categories": ["AFFILIATE_MARKETING", "ADVERTISING"],
  "brand": {
    "id": "brand_dummy",
    "displayName": "",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAACXBIWXMAAAWJAAAFiQFtaJ36AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAANSSURBVHgB1VdNSFRRFD4zjGTTCE9iyv7wIQWlkGNhGYVMUJGtFKFNhOPShWkEQRRou2gV0iKCSNta5KqECqcMWhTMa6FGLRrBNJyF5ozjqOntnHkzd+779c04EH5wePedc979vnvfvefdB/Cf4conmTEm4aUZrRZNRpOEsIL2FS3scrmiUEwgcRBthDkH5YZgs8BO5DyJ9YhQH1AI8ME2tDm2eVAf3fmS97Dio8cpeZdhCCuzLPInzCbin9nS2qIlw3p8hS2PTqVtbSZhltKm53PpyGW8RCCzulPrSXg9OwDKwnueI5X4oUFqglPllzQdpQa/Q7J/DFhilfu2XZTB21kHbl9J1jWPVifuErdO0EsQtpaePN3DagyGY8/gW+IL962M/oLFh4qGnLA8HIXE7Y+ii/p+KjrcwuhDeAmIRHpyEZ/mXvF26vkPy7xVJYY2K7poSwcNAhCa9xNdGgc7iHEdgQFrM0m9q0cjIPPug1AgXLl3bAp3mSFOsyBxAWbkh331UOreAVaQvdW87TkogR0s4s2igIA+Wur2wtmdrWYPpoW17O7g975bJyxnwdteA+4K04EERAG1ZhkNuNVaKjpA8vi5j0beUXkvvR2zIALpyQUoCeziPhLk7QzA9lANWEDmLeag3lMBsitC+oLkACPE7QGHoFfiFBstShFZAfOWGTEsOD9fACQm1fuKRoAqXBulfm3e3BTA4E2A6QksDAsAe3GRng4BHG8FJwImTaNETCbi9weUiyTH7uREEPnjK+o1i+lxVdASijnTbtY7HV74IlQM4VTMSC7Gxh/l7t/2aclFvOtTZ8QIRRQwZAjHzSeFIyHEx95Y59EMmMfDXAB+neazDo6/SbCFGDcfoR34uVH8FtzVpJRVgi18QryqwT63fJ/eM5BtcAGoKAziLBCBdAQscaAp1z53zTqv+rxeoIJc/QYBGdByzW3JozcA9jRqMzxYVg9d1fqrTqKILjCA/Jfvix7qu0V0GP4LMucCzaEhveDiUbXtr0cRFkWJdsLMhLrwyverArS4jqN/ABsBRfSy4qMX8gE+0M2KdywPQSFg6o9JhBWOEVboj4lOSIjl/2sWdNJ3vj+nMqinJzpMiGcIWt1UGqm8DmUK29bAP/SV6+PMecYlAAAAAElFTkSuQmCC"
  },
  "description": "Integration with webePartners",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "mid",
    "displayName": "MID",
    "simpleValueType": true,
    "help": "Your MID number assigned by the account manager.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "refer",
    "displayName": "Order Id",
    "simpleValueType": true,
    "help": "Unique order identifier.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "sum",
    "displayName": "Order value",
    "simpleValueType": true,
    "help": "Gross (Brutto) order value excluding shipping costs.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "dc",
    "displayName": "Discount code",
    "simpleValueType": true,
    "help": "Discount code used for the order."
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const setInWindow = require('setInWindow');

const webeOrder = {
  mid: data.mid,
  refer: data.refer,
  sum: data.sum,
};

if (data.dc) {
  webeOrder.dc = data.dc;
}

setInWindow('webeOrder', webeOrder, true);


const url1 = 'https://webetech.pl/js/webeconfirm.js';
injectScript(url1, null, null, url1);

const url2 = 'https://webep1.com/js/webeorder.js';
injectScript(url2, data.gtmOnSuccess, data.gtmOnFailure, url2);


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://webetech.pl/*"
              },
              {
                "type": 1,
                "string": "https://webep1.com/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "webeOrder"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 5/16/2025, 11:56:05 AM


