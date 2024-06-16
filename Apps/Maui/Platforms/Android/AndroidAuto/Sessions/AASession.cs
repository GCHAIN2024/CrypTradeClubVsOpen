using Android.Content;
using AndroidX.Car.App;
using Maui.Platforms.Android.AndroidAuto.Screens;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Maui.Platforms.Android.AndroidAuto.Sessions
{
    public class AASession : Session
    {
        public override Screen OnCreateScreen(Intent intent)
        {
            return new AAScreenMenu(CarContext);
        }
    }
}
