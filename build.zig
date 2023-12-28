const std = @import("std");

pub fn build(b: *std.Build) void {
    var obj = b.addStaticLibrary(.{
        .name = "tree-sitter-html",
        .target = b.standardTargetOptions(.{}),
        .optimize = b.standardOptimizeOption(.{}),
    });

    obj.linkLibC();
    obj.linkLibCpp();
    obj.addCSourceFile(.{ .file = .{ .path = "src/parser.c" }, .flags = &.{} });
    obj.addCSourceFile(.{ .file = .{ .path = "src/scanner.cc" }, .flags = &.{} });
    obj.addIncludePath(.{ .path = "src" });

    b.installArtifact(obj);
}
