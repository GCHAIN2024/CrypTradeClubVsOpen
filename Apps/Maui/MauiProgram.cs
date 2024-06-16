﻿using CommunityToolkit.Maui;
using Microsoft.Extensions.Logging;

using MauiLogics;

namespace Maui
{
    public static class MauiProgram
    {
        
        public static MauiApp CreateMauiApp()
        {
            Launching.init();

            var builder = MauiApp.CreateBuilder();

            builder
                .UseMauiApp<App>()
                .UseMauiCommunityToolkitMediaElement()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });

#if DEBUG
    		builder.Logging.AddDebug();
#endif

            return builder.Build();
        }
    }
}
