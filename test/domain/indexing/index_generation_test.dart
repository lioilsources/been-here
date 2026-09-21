import 'package:been_here/domain/indexing/index_progress.dart';
import 'package:flutter_test/flutter_test.dart';

IndexProgress _running(int inserted, {int deleted = 0}) => IndexProgress(
  status: IndexStatus.running,
  inserted: inserted,
  deleted: deleted,
);

void main() {
  test('a page of photos is not a reason to re-query', () {
    // Forty photos arrive, then forty more. Nothing on screen needs to move.
    expect(indexGeneration(_running(40)), indexGeneration(_running(80)));
    expect(indexGeneration(_running(80)), indexGeneration(_running(200)));
  });

  test('a few hundred photos is', () {
    expect(
      indexGeneration(_running(40)),
      isNot(indexGeneration(_running(300))),
    );
    expect(
      indexGeneration(_running(300)),
      isNot(indexGeneration(_running(600))),
    );
  });

  test('deleted photos count as changes too', () {
    expect(
      indexGeneration(_running(0)),
      isNot(indexGeneration(_running(0, deleted: 400))),
    );
  });

  test('the end of a pass is always its own step', () {
    // Otherwise the last photos of a pass wait for the next one.
    const finished = IndexProgress(
      status: IndexStatus.completed,
      inserted: 300,
    );
    expect(indexGeneration(finished), isNot(indexGeneration(_running(300))));
  });

  test('an idle index that changed nothing asks for nothing', () {
    expect(
      indexGeneration(const IndexProgress.idle()),
      indexGeneration(const IndexProgress(status: IndexStatus.completed)),
    );
  });
}
