//
//  Cleanish_Clock_Widget.swift
//  Cleanish Clock Widget
//
//  Created by Josh McArthur on 23/12/20.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }


    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        var entries = [SimpleEntry]()
        let currentDate = Date()
        let midnight = Calendar.current.startOfDay(for: currentDate)
        let nextMidnight = Calendar.current.date(byAdding: .day, value: 1, to: midnight)!

        for offset in 0 ..< 60 * 24 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: offset, to: midnight)!
            entries.append(SimpleEntry(date: entryDate))
        }

        let timeline = Timeline(entries: entries, policy: .after(nextMidnight))
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct SimpleWidgetEntryView: View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) private var widgetFamily
        
    static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "H:mm a"
        return formatter
    }()
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d"
        return formatter
    }()
    
    func getTextSize() -> CGFloat {
        switch self.widgetFamily {
        case .systemSmall:
            return 28.0
        case .systemLarge:
            return 72.0
        case .systemMedium:
            return 68.0
        @unknown default:
            return 64.0
        }
    }
    
    func getSubtitleTextSize() -> CGFloat {
        switch self.widgetFamily {
        case .systemSmall:
            return 28.0
        case .systemLarge:
            return 72.0
        case .systemMedium:
            return 24.0
        @unknown default:
            return 64.0
        }
    }
    
    func getFormattedTime(entry: SimpleEntry) -> String {
        return Self.timeFormatter.string(from: entry.date).lowercased()
    }
    
    func getFormattedDate(entry: SimpleEntry) -> String {
        return Self.dateFormatter.string(from: entry.date)
    }
    

    var body: some View {
        ZStack {
            VStack {
            Text("\(self.getFormattedTime(entry: entry))")
                .font(.custom("Roboto Light", size: self.getTextSize(), relativeTo: .largeTitle))
                .tracking(-1.5)
                .foregroundColor(Color("PrimaryClockColor"))
            Text("\(self.getFormattedDate(entry: entry))")
                .font(.custom("Roboto Light", size: self.getSubtitleTextSize(), relativeTo: .title))
                .foregroundColor(Color("SecondaryClockColor"))
            }
        }
        .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .center)
        .background(Image("BackgroundColor")).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

@main
struct Cleanish_Clock_Widget: Widget {
    let kind: String = "Cleanish_Clock_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            SimpleWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName(" ")
        .description("Cleanish digital clock inspired by Android")
    }
}

struct Cleanish_Clock_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
         
        SimpleWidgetEntryView(entry: SimpleEntry(date: Date()))
            .environment(\.colorScheme, .dark)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
            SimpleWidgetEntryView(entry: SimpleEntry(date: Date()))
                .environment(\.colorScheme, .light)
                .previewContext(WidgetPreviewContext(family: .systemMedium))
         
        }
    }
}
