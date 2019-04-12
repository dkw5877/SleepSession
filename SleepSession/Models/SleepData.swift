

struct SleepData: Codable {
    let awake: [DataPoint]
    let rem: [DataPoint]
    let light: [DataPoint]
    let deep: [DataPoint]
}
