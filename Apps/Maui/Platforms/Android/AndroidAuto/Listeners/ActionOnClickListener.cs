﻿using AndroidX.Car.App;
using AndroidX.Car.App.Model;

namespace Maui.Platforms.Android.AndroidAuto.Listeners
{
    public class ActionOnClickListener : Java.Lang.Object, IOnClickListener
    {
        private readonly CarContext _carContext;
        private readonly string _message;

        public ActionOnClickListener(CarContext carContext, string message = null)
        {
            _carContext = carContext;
            _message = message;
        }

        public void OnClick()
        {
            CarToast.MakeText(_carContext, _message, CarToast.LengthLong).Show();
        }
    }
}
